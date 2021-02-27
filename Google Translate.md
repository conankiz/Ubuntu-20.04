# SETTING UP AND CONFIGURING THE 'TRANSLATE HIGHLIGHTED TEXT' SCRIPT
- 1. To be able to use the script, firstly install libnotify-bin (so the script can send desktop notifications), wget (to retrieve the translation from Google) and xsel (which is used to get the currently highlighted text). In Ubuntu, Linux Mint, etc. install them using the following command:
```
sudo apt-get install libnotify-bin wget xsel
```
- 2. Next, copy the script code below:
```
#!/usr/bin/env bash
text="$(xsel -o)"
translate="$(wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=en&dt=t&q=$(echo $text | sed "s/[\"'<>]//g")" | sed "s/,,,0]],,.*//g" | awk -F'"' '{print $2, $6}')"
echo -e "Original text:" "$text"'\n' > /tmp/notitrans
echo "Translation:" "$translate" >> /tmp/notitrans
zenity --text-info --title="Translation" --filename=/tmp/notitrans
```
and paste it in a new file - let's call it "notitrans" (well, you can call it whatever you want, but that's how I'll refer to it from now on).

In the script above, replace "tl=en" with the language into which you want the text to be translated, for instance "tl=ru" for Russian, "tl=fr" for French and so on.

After you're done, save the file in your home directory and make it executable using the following command:
```
chmod +x ~/notitrans
```
- 3. Place the script in your $PATH - for instance, to copy the script to /usr/local/bin/, use the following command:
```
sudo mv ~/notitrans /usr/local/bin/
```

- 4. To be able to use the script, you can assign it a custom keyboard shortcut. Doing this depends on your desktop environment.

On GNOME (and Unity), you can do this by going to System Settings > Keyboard > Shortcuts > Custom Shortcuts, where you'll need to click "+" to add a new keyboard shortcut. Here, enter any name you want for the new custom shortcut and "notitrans" as the command:
And finally, assign a keyboard shortcut to the newly added command by clicking on it and then holding down the keys you want to assign to it. Make sure the keyboard shortcut is not already in use!

