Part 2: Adding a Map
====================


Well, we have a player. What we need now is a map to move around on.

The map is of course a different thing from the player, so we will create a new scene for it. So go ahead and do that, call the root node "GameMap", and save it into it's own folder.

For the actual map itself, we will use a Godot tilemap, which is simply a grid of tiles - exactly what we want to start with.

Add a tilemap to the _GameMap_ node (Click the + sign in the scene tree and search for _tilemap_). Tilemaps are conceptually quite simple, but there is some legwork that is required. First, what size should the tile be? Well ours are 32x32, so go to the property inspector on the right and under **Cell** ensure both sizes are 32. You should see the grid in the scene display become smaller.

Next we need to add some actual tiles for the map to display. Again in the property settings for the tilemap, click on the **empty** on the Tile Set property and choose **New Tileset**. Nothing much will have changed after this, so now click on the new Tile Set and you should see the tileset editor appear in the lower middle of your screen. There's no tiles right now, so let's go and add some.

Using the FileSystem display on the bottom left, find the tile images we chose earlier and drag them into the box to the immediate right. At this point *you have not selected any tiles*. You've just told Godot that we are going to take tiles from these images. We need to select what part of the tile to use (even though in this case every image is a single tile).

Click on one of the tiles you dragged and dropped. Then click **New Single Tile**. Click **Enable snap**, it makes life a lit easier (the snap will be to the size of the grid, in our case 32\*32). Now drag and select the region on the tile (which will be practically automatic now we have snapping done). Repeat the process with the other tile.

You can also edit the names of the tiles if you like. Click on the tile (note: not the image you chose, the tile you created), and you should be able to edit the name of the tile in the property inspector on the right hand side of the screen.

Now we can finally draw a map. Later we'll generate one, but let's start with the easy way. Click on the tilemap in the scene tree. You should see an option of two tiles; click one and then directly draw onto the screen. Right-click will delete tiles.

Not too much work, right? Now we just have to put the map into the world scene. Make sure the map scene is saved, go to the world scene and add an instance of the map scene as a child of the world root node.

Some issues here: if you can't see the player, they may just be behind the map.

Now the first thing you'll likely see is that the sprite is slightly offset from the correct place. To fix this, we'll have to edit the player scene. In the player scene, set the Player node to 320, 160 (under transform -> position). Also, on the sprite node, ensure Offset -> centered is off. Save the scene, and go back to the world scene.

Run the game with F5. You should be able to move the player around the map.
