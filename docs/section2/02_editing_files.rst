Text Editors
======================

As an HPC user, you will frequently need to edit text files directly from the command line, for example to create the configuration files needed to launch jobs on the cluster. 
In this section, you will learn how to use command-line text editors. 


1) Text Editing with Nano
^^^^^^^^^^^^^^^^^^^^^

Nano is a straightforward, modeless text editor used on Linux file systems.

Opening a File
--------------

Open the file ``example_template.slurm``:

.. code-block:: console

   [ls6]$ nano example_template.slurm

Understanding Nano Interface
----------------------------

You can start typing directly into the file as soon as it opens (similar to typing in TextEdit or Notepad). Commands are performed using key combinations:

* **Control Key (``^``):** Represented by a caret symbol ``^`` in the bottom menu. Hold down ``Ctrl`` and press the specified letter (e.g., ``Ctrl+O``).
* **Meta Key (``M-``):** Represented by ``M-`` in documentation. On most systems, this corresponds to the ``Alt`` key or pressing ``Esc`` followed by the key.

Essential Key Shortcuts
-----------------------

Below is a summary of key shortcuts for navigating, editing, saving, and quitting:

.. code-block:: text

   # Navigating the File:

   arrow keys        move up, down, left, right
       Ctrl+Y        page up
       Ctrl+V        page down

       Ctrl+A        move to beginning of line
       Ctrl+E        move to end of line

   # Saving and Quitting:

       Ctrl+O        save (WriteOut) the file without closing, press Enter to confirm
       Ctrl+X        exit Nano (prompts to save if modifications exist)

   # Editing Text:

       Ctrl+K        cut current line (or selected block)
       Ctrl+U        paste (uncut) copied or cut text
       Ctrl+W        search for text (Where Is)

Additional Resources
--------------------

* Official Documentation: `GNU Nano Documentation <https://www.nano-editor.org/docs.php>`_
* Command Line Help: Run ``man nano`` in your terminal window.
 
 




2) Text Editing with VIM
^^^^^^^^^^^^^^^^^^^^^

VIM is another text editor used on Linux file systems.

Open the file ``example_template.slurm``:

.. code-block:: console
 
   [ls6]$ vim example_template.slurm

Unlike Nano, with VIM there are two separate "modes" for typing and running commands. 
They are called "insert mode" and "normal mode".  
In insert mode, the user is typing text into a file as seen through the terminal
(think about typing text into TextEdit or Notepad).  In normal mode, the user can perform other
functions like save, quit, cut and paste, find and replace, etc. (think about clicking the menu
options in TextEdit or Notepad). The two main keys to remember to toggle between the modes are ``i``
and ``Esc``.

Entering VIM insert mode:

.. code-block:: text

   > i

Entering VIM normal mode:

.. code-block:: text

   > Esc

A summary of the most important keys to know for normal mode are (more on your cheat sheet):

.. code-block:: text

   # Navigating the file:

   arrow keys        move up, down, left, right
       Ctrl+u        page up
       Ctrl+d        page down

            0        move to beginning of line
            $        move to end of line

           gg        move to beginning of file
            G        move to end of file
           :N        move to line N

   # Saving and quitting:

           :q        quit editing the file
           :q!       quit editing the file without saving

           :w        save the file, continue editing
           :wq       save and quit

For more information, see:
  * `http://openvim.com/ <http://openvim.com/>`_
  * Or type on the command line: ``vimtutor``




 


 