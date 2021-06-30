Part 0: Setup
=============

Welcome to the first part of the Godot Roguelike tutorial.

This tutorial is largely based on the Python tutorial found at http://rogueliketutorials.com/tutorials/tcod/2019/part-1/, which is itself based on a tutorial at http://www.roguebasin.com/index.php?title=Complete_Roguelike_Tutorial,_using_python%2Blibtcod - thanks to the writers of both of these.

This first part is simply to get Godot and some graphics set up.

Go to [the Godot download page](https://godotengine.org/download) and grab the standard version; 64-bit is fine unless you have an older machine.

We'll need some simple graphics as well. I'm using the set [found here](https://code.google.com/archive/p/crawl-tiles/downloads). You can use other tiles as well, but one thing to note is that I'll be using 32x32 tiles for this tutorial and it'll be slightly easier to follow if you are doing the same.

Now let's start our project.

Open up Godot and choose "New Project"

[image #1](image#1)

Click browse to choose a folder to put your project in. add a project name at the top left, then click "Create Folder". Finally, click "Create & Edit". After a little pause, we should be in our project.

We want to copy over some images to use, so before we do that let's organise the project a bit.

Go to the bottom left area to the "Filesystem", right click inside and choose "New Folder". Call it "gfx". Inside that folder, add 2 more folders: "creatures" and "tiles".

Now open up a view of the folder you downloaded earlier. Open up dc-mon and then drag the file "human.png" over the "creatures" folder. Switch back to Godot.

As you drag files into Godot, it will automatically load them in. It may also convert the file into a slightly different format. This is something we don't want to do, but it's easy to fix.

Click on the "human.png" image in godot, and then up to where it says "Scene" in the top left and click the "Import" tab. You'll see that "Filter" is set to on: click it off and then press "Reimport". To ensure we don't have to keep doing this, click the "Preset" and the "Set as default for 'texture'".

Finally, we'll need some tiles. Open up the crawl-tiles folder and navigate to dc-dngn and copy over "stone_brick1.png" to the gfx\tiles folder in Godot. Put the file "dc-dngn\lair0.png" into the same tiles folder.

Great, we are all setup! Now we can start to make a game!
