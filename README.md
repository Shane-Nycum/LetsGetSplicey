# SpliceSampleHelper

This is a PowerShell script that I wrote to improve my workflow using Splice + Ableton.
The Splice desktop app is nice to use and browse your samples;
But I personally prefer being able to browse and audition them directly in Ableton.

When you download a sample from Splice, the .wav file is placed in a directory that's 3 or 4 levels deep in your Splice samples folder.
You can add this folder to your Places view in Ableton;
But the levels-deep folder structure makes browsing them painful.
And you can't move / reorganize the files without causing problems for Splice desktop app.

I suspect that what most people are doing in this situation is to make copies of the .wav files to a different directory, that they can organize how they like.
But I say, why spend several minutes performing this task, when I can spend several hours automating it?!

This script will do several things for you:
    1) Scan your Splice samples folder, and compare its contents to a second folder (referred to here onwards as your "Ableton samples folder")
    2) Copy any file that is under your Splice samples folder, but not found anywhere under your Ableton samples folder, to your Ableton samples folder at root-level.
    3) Except that the copy is not really a copy - it's a hard link (google it)

The hard link is a pointer of sorts, to the same file on your disk as the file in your Splice samples folder.
It behaves like any other file - you can audtion it, import it into your project, rename it, whatever.
And it won't cause the amount of disk space you're using to double, like copying the file would.

To use the script, update the folder paths in the code to the paths you are using on your machine.
Run it once to create hard links for everything that's currently in your Splice samples folder.
Whenever you download new samples from Splice, run it again and it will create hard links for the new samples.

This should run on any Windows PC.
I'm not sure about Macs;
There's a new-ish PowerShell environment out for Macs that runs on .NET core, you could try using that.
I'd be curious to hear how it goes.
(Also if you're savvy and want to convert this to zsh or something, feel free to post it.)

Anyways, hope this thing helps someone out there. Godspeed!
