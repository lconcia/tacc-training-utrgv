Network and File Transfers
==========================

In order to login or transfer files to a remote Linux file system, you must know the hostname
(unique network identifier) and the username. If you are already on a Linux file system, those are
easy to determine using the following commands:

.. code-block:: console

   [ls6]$ whoami
   lconcia
   [ls6]$ hostname -f
   login2.ls6.tacc.utexas.edu

To practice transferring files to Lonestar6's ``$WORK`` and ``$SCRATCH``, we need to identify the
path to our ``$WORK`` and ``$SCRATCH`` directory. To identify these paths, we can use helpful command shortcuts.

To identify the path to our ``$WORK`` directory, we can use ``cd $WORK`` or the helpful shortcut
``cdw``:

.. code-block:: console
   
   [ls6]$ cd $WORK
   [ls6]$ pwd
   /work/03302/lconcia/ls6

or

.. code-block:: console
   
   [ls6]$ cdw
   [ls6]$ pwd
   /work/03302/lconcia/ls6

To identify the path to our ``$SCRATCH`` directory, we can use ``cd $SCRATCH`` or the helpful
shortcut ``cds``:

.. code-block:: console
   
   [ls6]$ cd $SCRATCH
   [ls6]$ pwd
   /scratch/03302/lconcia

or

.. code-block:: console
   
   [ls6]$ cds
   [ls6]$ pwd
   /scratch/03302/lconcia    

Copying files from your local computer to Lonestar6's ``$WORK`` would require the ``scp`` command:

.. code-block:: console

   [local]$ touch my_file 
   [local]$ scp my_file lconcia@ls6.tacc.utexas.edu:/work/03302/lconcia/ls6
   (enter password)
   (enter token)

In this command, you specify the name of the file you want to transfer (``my_file``), the username
(``lconcia``), the hostname (``ls6.tacc.utexas.edu``), and the path you want to put the file
(``/work/03302/lconcia/ls6``). Take careful notice of the separators including spaces, the @ symbol,
and the colon. 


Copy files from Lonestar6's ``$WORK`` to your local computer using the following:

.. code-block:: console

   [local]$ scp lconcia@ls6.tacc.utexas.edu:/work/03302/lconcia/ls6/my_file .
   (enter password)
   (enter token)

.. note::

   If you wanted to copy ``my_file`` from ``$SCRATCH``, the path you would specify after the
   colon would be ``/scratch1/03302/lconcia/ls6/my_file``.

Instead of files, full directories can be copied using the "recursive" flag (``scp -r ...``). See
additional example ``scp`` usage `here <https://en.wikipedia.org/wiki/Secure_copy>`__.


EXERCISE
~~~~~~~~

1. Logout until you are back to your local computer.
2. Make your own ``my_file`` on your local computer using knowledge from our previous sections 
3. copy ``my_file`` to your ``$SCRATCH`` file system on Lonestar6 



Review of Topics Covered
------------------------

+------------------------------------+-------------------------------------------------+
| Command                            |          Effect                                 |
+====================================+=================================================+
| ``hostname -f``                    |  print hostname                                 |
+------------------------------------+-------------------------------------------------+
| ``whoami``                         |  print username                                 |
+------------------------------------+-------------------------------------------------+
| ``ssh username@hostname``          |  remote login                                   |                                                 
+------------------------------------+-------------------------------------------------+
| ``logout``                         |  logout                                         |
+------------------------------------+-------------------------------------------------+
| ``cd $WORK``, ``cdw``              |  navigate to ``$WORK`` file system              |
+------------------------------------+-------------------------------------------------+
| ``cd $SCRATCH``, ``cds``           |  navigate to ``$SCRATCH`` file system           |
+------------------------------------+-------------------------------------------------+
| ``scp local remote``               |  copy a file from local to remote               |
+------------------------------------+-------------------------------------------------+
| ``scp remote local``               |  copy a file from remote to local               |
+------------------------------------+-------------------------------------------------+
|  ``<Ctrl+d>``                      |  logout of host                                 |
+------------------------------------+-------------------------------------------------+






Additional Resources
--------------------

* `Practice Linux commands safely in a web-based emulator <https://bellard.org/jslinux/vm.html?url=alpine-x86.cfg&mem=192>`_
* `This is a good summary of the important commands you need to know <https://linuxjourney.com/lesson/the-shell>`_
