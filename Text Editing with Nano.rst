Text Editing with Nano
======================

Nano is a straightforward, modeless text editor used on Linux file systems.

Opening a File
--------------

Open the file ``example_template.slurm``:

.. code-block:: console

   [frontera]$ nano example_template.slurm

Understanding Nano Interface
----------------------------

Unlike VIM, Nano does not use separate modes for typing and running commands. You can start typing directly into the file as soon as it opens (similar to typing in TextEdit or Notepad). 

Commands are performed using key combinations:

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

       Alt+\         move to beginning of file
       Alt+/         move to end of file
       Ctrl+_        move to line N (or Alt+G)

   # Saving and Quitting:

       Ctrl+O        save (WriteOut) the file, press Enter to confirm
       Ctrl+X        exit Nano (prompts to save if modifications exist)

   # Editing Text:

       Ctrl+K        cut current line (or selected block)
       Ctrl+U        paste (uncut) copied or cut text
       Ctrl+W        search for text (Where Is)
       Alt+R         search and replace text

Additional Resources
--------------------

* Official Documentation: `GNU Nano Documentation <https://www.nano-editor.org/docs.php>`_
* Command Line Help: Run ``man nano`` in your terminal window.














Text Editing with Nano
======================

Nano is a straightforward, modeless text editor used on Linux file systems.

Opening a File
--------------

Open the file ``example_template.slurm``:

.. code-block:: console

   [frontera]$ nano example_template.slurm

Understanding Nano Interface
----------------------------

Unlike VIM, Nano does not use separate modes for typing and running commands. You can start typing directly into the file as soon as it opens (similar to typing in TextEdit or Notepad). 

Commands are performed using key combinations:

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

       Alt+\         move to beginning of file
       Alt+/         move to end of file
       Ctrl+_        move to line N (or Alt+G)

   # Saving and Quitting:

       Ctrl+O        save (WriteOut) the file, press Enter to confirm
       Ctrl+X        exit Nano (prompts to save if modifications exist)

   # Editing Text:

       Ctrl+K        cut current line (or selected block)
       Ctrl+U        paste (uncut) copied or cut text
       Ctrl+W        search for text (Where Is)
       Alt+R         search and replace text

Additional Resources
--------------------

* Official Documentation: `GNU Nano Documentation <https://www.nano-editor.org/docs.php>`_
* Command Line Help: Run ``man nano`` in your terminal window.





 