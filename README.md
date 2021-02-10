# Splice Sample Helper

This is a PowerShell script that I wrote to improve my workflow using Splice + Ableton.<br/>
The Splice desktop app is nice to use and browse your samples;<br/>
But I personally prefer being able to browse and audition them directly in Ableton.<br/>
<br/>
When you download a sample from Splice, the .wav file is placed in a directory that's 3 or 4 levels deep in your Splice samples folder.<br/>
You can add this folder to your "Places" view in Ableton;<br/>
But the levels-deep folder structure makes browsing them painful.<br/>
And you can't move / reorganize the files without causing problems for Splice desktop app.<br/>
<br/>
I suspect that what most people are doing in this situation is to make copies of the .wav files to a different directory, that they can organize how they like.<br/>
But I say, why spend several minutes performing this task, when I can spend several hours automating it?!<br/>
<br/>
This script will do a few nice things for you:<br/>
  1) Scan your Splice samples folder, and compare its contents to a second folder (referred to here onwards as your "Ableton samples folder")<br/>
  2) Copy any file that is under your Splice samples folder, but not found anywhere under your Ableton samples folder, to your Ableton samples folder at root-level.<br/>
  3) Except that the copy is not really a copy - it's a hard link (google it)<br/>
<br/>
The hard link is a pointer of sorts, to the same file on your disk as the file in your Splice samples folder.<br/>
It behaves like any other file - you can audtion it, import it into your project, rename it, whatever.<br/>
And it won't cause the amount of disk space you're using to double, like copying the file would.<br/>
<br/>
To use the script, update the folder paths in the code to the paths you are using on your machine.<br/>
Run it once to create hard links for everything that's currently in your Splice samples folder.<br/>
Whenever you download new samples from Splice, run it again to create hard links for the new samples.<br/>
<br/>
This should run on any Windows PC.<br/>
I'm not sure about Macs;<br/>
There's a new-ish PowerShell environment out for Macs that runs on .NET core, you could try using that.<br/>
I'd be curious to hear how it goes.<br/>
(Also if you want to convert this to zsh or something, feel free to post it.)<br/>
<br/>
Hope this helps someone out there. Godspeed!<br/>
