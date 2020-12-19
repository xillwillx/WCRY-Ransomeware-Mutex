Account moved to: https://gitlab.com/illwill 


# WCRY-Ransomeware-Mutex
Just a quick console program written in MASM to prevent the WCRY ransomware from encrypting files on a machine. 
It creates a mutex with the same name that the ransomware uses to stop from running its code more than once.

This does not prevent EternalBlue/DoublePulsar from owning your machine. Update and patch your machine. More Info here:
http://willgenovese.com/m17-010-eternalblue/

How to: 
Run the exe and minimize the window to your taskbar and leave running.


![Alt text](/wcry.png?raw=true "WCRY Mutex")
