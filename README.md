# MoreMesecons

Based on Mesecons by Jeija  
By @paly2  
With the participation of @LeMagnesium (bugfix), @Ataron (textures), @JAPP (texture), and @HybridDog (many things).

MoreMesecons is a mod for minetest wich adds some mesecons items.

![Screenshot](https://imgrush.com/XcGejYXNTbdm.png)

### New items

* `Adjustable Blinky plant` : Like a mesecons blinky plant, but... adjustable. Right-click to change the interval.
* `Adjustable Player Detector` : Like a mesecons player detector, but you can change its detection radius by right-click.
* `Craftable Command Block` : A command block with just some commands accepted. The admin can change the accepted command (first line of the init.lua), default "tell". Only "@nearest" can be used in the commands, and the admin can change the maximum distance of "@nearest" (default 8 blocks).
* `Dual Delayer` : If it receives a mesecons signal, port 1 turns on immediatly and port 2 turns on 0.4 seconds later. At the end of the signal, port 2 turns off immediatly and port 1 turns off 0.4 secondes later. For example, this is useful for double extenders.
* `Player Killer` : This block kills the nearest player (with a maximal distance of 8 blocks by default) (if this player isn't its owner) when it receives a mesecons signal.
* `Sayer` : This node sends a message to every players inside a radius of 8 nodes.
* `Signal Changer` : If it receives a signal on its pin "F", it turns on. If ti receives a signal on its pin "O", it turns off.
* `Switch Torch` : It connects just like Mesecons Torch. If it receives a signal, it turns on, and if it receives a second signal, it turns off.
* `Teleporter` : If you place one teleporter, if it receives a mesecons, it teleports the nearest player on itself. If you place two teleporters on the same axis, if one receives a mesecons signal, it teleports the nearest player on the second (with a maximal distance of 50 nodes by default). The player teleporter must be inside a radius of 25 nodes.
* `Temporary Gate` : If it receives a mesecons signal, whatever its duration, a mesecons signal is send with a fixed duration. You can change it by right-click (in seconds) (you can write for example 0.2 to send a pulse, or 20 to send long signals).
* `Wireless` : Place 2 (or more) wireless somewhere. Change their channel by right-click. If you send a signal to a wireless, every wireless wich have the same channel will send the signal.
