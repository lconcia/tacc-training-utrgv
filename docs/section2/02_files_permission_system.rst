.. _linux-permissions:

Linux File Permissions
======================

Every file and folder on a Linux system has a set of rules that control who can read it, change it, or run it. These rules are called *permissions*. On a shared research computing system such as HPC clusters, permissions keep your data private from other users, and they also let your project teammates work with the files you share.

Topics covered include:

   * Who owns a file and which group it belongs to (``whoami``, ``groups``)
   * Reading the permission string shown by ``ls -l``
   * Changing permissions with ``chmod`` (symbolic and octal notation)
   * Changing the group of a file with ``chgrp``
   * Default permissions and ``umask``
   * Keeping shared project folders safe to use

Users, Groups, and Others
-------------------------

Every file has an owner and a group. Access is split into three categories of people:

* **User (u)**: the account that owns the file. This is usually the account that created it.
* **Group (g)**: a set of users who share access. On HPC systems, all the users on a project allocation share the same group, so everyone on the project can work with the same data.
* **Others (o)**: everyone else on the system.


.. note::

    On HPC systems, all the users on a project allocation share the same group, so everyone on the project can work with the same data.

To see who you are and which groups you belong to, use these commands:

.. code-block:: console

   [ls6]$ whoami
   username
   [ls6]$ groups
   username projectgrp

Reading the Permission String
-----------------------------

Use ``ls -l`` to see the permissions, owner, and group for each item in a folder:

.. code-block:: console

   [ls6]$ ls -l
   total 4
   -rw-r--r-- 1 username projectgrp    0 Nov 10 09:12 notes.txt
   drwxr-x--- 2 username projectgrp 4096 Nov 10 09:14 results

The first column is the permission string. Read it in four parts:

* **Character 1** is the type: ``-`` for a regular file, ``d`` for a directory.
* **Characters 2-4** are the permissions for the owner.
* **Characters 5-7** are the permissions for the group.
* **Characters 8-10** are the permissions for others.

Each position is either a letter (the permission is granted) or a dash (it is not). The three letters mean slightly different things for files and directories:

.. list-table:: What r, w, and x mean
   :header-rows: 1
   :widths: 15 40 45

   * - Letter
     - On a file
     - On a directory
   * - ``r`` (read)
     - View the contents of the file
     - List the names of items inside
   * - ``w`` (write)
     - Change or delete the contents of the file
     - Create, rename, or remove items inside
   * - ``x`` (execute)
     - Run the file as a program or script
     - Enter the directory with ``cd`` and access items inside

Reading the example above:

* ``notes.txt`` (``-rw-r--r--``) is a file. The owner can read and write it. The group and others can only read it.
* ``results`` (``drwxr-x---``) is a directory. The owner can do everything. The group can list and enter it but cannot change it. Others have no access at all.

.. note::

   A directory with ``r`` but no ``x`` lets you see the names of its contents, but you cannot ``cd`` into it or open the files inside. Directories almost always need both ``r`` and ``x`` to be useful.

Changing Permissions with chmod
-------------------------------

The ``chmod`` (change mode) command sets permissions. You can write them in two ways.

Symbolic Notation
~~~~~~~~~~~~~~~~~

Symbolic notation describes a change in three parts: who is affected, what operation to perform, and which permission to change.

* **Who**: ``u`` (user), ``g`` (group), ``o`` (others), or ``a`` (all three)
* **Operation**: ``+`` (add), ``-`` (remove), or ``=`` (set exactly)
* **Permission**: ``r``, ``w``, or ``x``

.. code-block:: console

   [ls6]$ chmod u+x myscript.sh      # add execute permission for the owner
   [ls6]$ chmod g-w notes.txt        # remove write permission from the group
   [ls6]$ chmod o= notes.txt         # remove all permissions from others

Octal Notation
~~~~~~~~~~~~~~

Octal notation uses a single digit for each category. Each permission has a value: ``r`` = 4, ``w`` = 2, and ``x`` = 1. For each category, add up the values of the permissions you want.

.. list-table:: Calculating each octal digit
   :header-rows: 1
   :widths: 25 25 50

   * - Permissions
     - Calculation
     - Digit
   * - ``rwx``
     - 4 + 2 + 1
     - 7
   * - ``rw-``
     - 4 + 2
     - 6
   * - ``r-x``
     - 4 + 1
     - 5
   * - ``r--``
     - 4
     - 4
   * - ``---``
     - none
     - 0

The digits are always in the same order: owner, group, then others. For example, ``chmod 640 notes.txt`` sets the owner to ``rw-`` (6), the group to ``r--`` (4), and others to ``---`` (0):

.. code-block:: console

   [ls6]$ chmod 640 notes.txt
   [ls6]$ ls -l notes.txt
   -rw-r----- 1 username projectgrp 0 Nov 10 09:12 notes.txt

Some common octal patterns are worth memorizing:

.. list-table:: Common permission patterns
   :header-rows: 1
   :widths: 15 50 35

   * - Octal
     - Meaning
     - Typical use
   * - ``600``
     - Owner: read and write. Group and others: none.
     - Private files
   * - ``644``
     - Owner: read and write. Group and others: read.
     - Shared files; common default for files
   * - ``640``
     - Owner: read and write. Group: read. Others: none.
     - Files your project team can read
   * - ``700``
     - Owner: full access. Group and others: none.
     - Private scripts or folders
   * - ``750``
     - Owner: full access. Group: read and enter. Others: none.
     - Folders your team can browse
   * - ``755``
     - Owner: full access. Group and others: read and enter.
     - Public folders; common default for folders
   * - ``770``
     - Owner and group: full access. Others: none.
     - Shared project folders

Changing an Entire Folder
~~~~~~~~~~~~~~~~~~~~~~~~~

To change a folder and everything inside it, add ``-R`` (recursive):

.. code-block:: console

   [ls6]$ chmod -R 750 results/

Be careful with ``-R``. A numeric mode like ``755`` applied to everything also marks every file as executable. The capital ``X`` in symbolic mode adds execute permission only to directories (and to files that are already executable), which is usually what you want:

.. code-block:: console

   [ls6]$ chmod -R u+rwX,g+rX,o= results/

Changing the Group
------------------

The ``chgrp`` (change group) command sets which group a file belongs to. You can assign any group you are a member of:

.. code-block:: console

   [ls6]$ chgrp projectgrp notes.txt
   [ls6]$ chgrp -R projectgrp results/

Changing the owner (``chown``) is normally restricted to administrators, so on a shared system you usually cannot hand a file to another user. If a colleague needs access, make sure the file belongs to a group you both share, and set the group permissions accordingly.

Default Permissions and umask
-----------------------------

When you create a new file or folder, the system starts from a base permission and removes the bits listed in your ``umask``. The base is 666 for files and 777 for folders. Files never get execute permission by default.

.. code-block:: console

   [ls6]$ umask
   0022
   [ls6]$ touch new_file.txt
   [ls6]$ mkdir new_folder
   [ls6]$ ls -l
   -rw-r--r-- 1 username projectgrp 0 Nov 10 10:02 new_file.txt
   drwxr-xr-x 2 username projectgrp 4096 Nov 10 10:02 new_folder

With a umask of ``022``, files start at 666 minus 022, which gives 644. Folders start at 777 minus 022, which gives 755.

If you want your new files to be private by default, you can change the umask for the current session:

.. code-block:: console

   [ls6]$ umask 077
   [ls6]$ touch private_file.txt
   [ls6]$ ls -l private_file.txt
   -rw------- 1 username projectgrp 0 Nov 10 10:05 private_file.txt

A change made with ``umask`` lasts only for the current session. To make it permanent, add the command to your shell's startup file.

.. note::

   The default umask on your system may differ from the example above. Run ``umask`` to check your current value.

Special Permissions (For Reference)
-----------------------------------

You may see two additional markings in ``ls -l`` output. You will rarely need to set these yourself, but recognizing them helps when something looks unexpected.

* **Sticky bit (t)**: In a shared folder, only the owner of a file can delete or rename it, even if everyone else can write to the folder. The temporary folder ``/tmp`` is a common example:

.. code-block:: console

   [ls6]$ ls -ld /tmp
   drwxrwxrwt 12 root root 4096 Nov 10 10:15 /tmp

* **Setuid (s)**: An executable with an ``s`` in the owner's execute position runs with the owner's privileges instead of yours. The ``passwd`` command works this way so that ordinary users can change their own passwords. It appears as ``-rwsr-xr-x``.

Troubleshooting "Permission denied"
-----------------------------------

When a command fails with ``Permission denied``, check these things in order:

1. **Who owns the file, and what are its permissions?** Use ``ls -l``.
2. **Are you in the group that the file belongs to?** Use ``groups``.
3. **Can you reach the file?** You need ``x`` on every directory in the path. Check the parent folder with ``ls -ld``.

For example:

.. code-block:: console

   [ls6]$ cat shared_data/summary.txt
   cat: shared_data/summary.txt: Permission denied
   [ls6]$ ls -ld shared_data/
   drwx------ 2 otheruser projectgrp 4096 Nov 10 09:20 shared_data/

The folder belongs to ``otheruser`` and grants no access to the group or to others, so you are blocked from entering it. Ask the owner to adjust the folder's group permissions, and make sure the folder's group is one you belong to.

Good Practices for Shared Folders
---------------------------------

* **Avoid** ``chmod 777``. It gives read, write, and execute permission to every user on the system, which is almost never needed.
* **Use groups** to share with collaborators instead of opening access to everyone.
* **Keep private work private by default.** Personal scripts and notes are good candidates for ``600`` or ``700``.
* **Check your work.** Run ``ls -l`` after any ``chmod`` to confirm the result.

.. warning::

   Do not run ``chmod -R 777`` on a project folder. It opens the entire folder to every user on the system. Once other users have read or changed those files, you cannot undo that exposure.

EXERCISE
~~~~~~~~

1. Create an empty file called ``private.txt``. Use ``ls -l`` to check its default permissions. Then change it so that only you can read and write it.
2. Create a folder called ``shared_results``. Use octal notation to give you and your group full access, and give others no access.
3. Create a file called ``script.sh``. Use symbolic notation to make it executable by you (``u+x``), then verify the result with ``ls -l``.
4. Run ``umask`` to check your current default. Predict the permissions of a new file and a new folder, then create them and compare.
5. Explain in your own words why a folder needs ``x`` permission before you can ``cd`` into it.

Review of Topics Covered
------------------------

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - Command
     - Effect
   * - ``whoami``
     - show your username
   * - ``groups``
     - list the groups you belong to
   * - ``ls -l``
     - show permissions, owner, and group for each item
   * - ``ls -ld dir/``
     - show the permissions of a folder itself, not its contents
   * - ``chmod u+x file``
     - add execute permission for the owner
   * - ``chmod g-w file``
     - remove write permission from the group
   * - ``chmod 640 file``
     - set permissions using octal notation
   * - ``chmod -R 750 dir/``
     - apply permissions to a folder and everything inside it
   * - ``chgrp group file``
     - change the group a file belongs to
   * - ``umask``
     - show the default permission mask for new files and folders

Additional Resources
--------------------

* `GNU Coreutils Manual <https://www.gnu.org/software/coreutils/manual/coreutils.html>`_: the reference for ``chmod``, ``chgrp``, and ``umask``.
