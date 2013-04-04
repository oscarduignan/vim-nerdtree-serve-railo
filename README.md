NERDTree Serve Railo
====================

This plugin allows you to start serving railo express from a directory using a function call from inside vim. A mapping has been added for NERDTree that calls this function on the currently selected directory.

So for example if you typed `:ServeRailo /path/to/webroot` then a cmd window would pop up and start a new railo express process serving the files in the folder passed at http://localhost:8888 (or at whichever port you had railo express configured to serve from).

My average workflow now when starting work on a project is to open up vim with my global keybinding, open up nerd tree from a bookmark (a bookmark in nerd tree roughly represents a project for me), select the webroot node in the NERDTree window and type `rs`. At this point I now have access to all the projects source files and I can open my web browser to http://localhost:8888 and view the running site.

Limited in that you can only have the one site running at a time, and configuration options (like which port) are not passable through vim.

It requires that there is a command on your path called "serve_railo" that accepts one parameter that is the path to start railo express in (it's webroot). Steps I took to achieve:

1. Install Railo Express
2. Use the method detailed here to customise it so it serves files from a directory you pass in when you start it up
3. Add the installation directory to your PATH
4. Create a file there called `serve_railo.bat` with the following contents (you will need to customise the paths to suit your setup)

```
cd D:\railo4
"C:\Program Files\Java\jre7\bin\java.exe" -DSTOP.PORT=8887 -DSTOP.KEY=railo -Xms256M  -Xmx1024M -jar start.jar -Drespath=%1
