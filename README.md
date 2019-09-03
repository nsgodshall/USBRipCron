# USBRipCron
A small bash script which uses USBRIP to parse sytem logs and alert user if suspicious devices have been connected to their computer via email. Meant to be used as a crontab. 

## How to use 
Simply clone the shell script to a directory of your choosing and modify the `$authDir` variable in the script to the auth.json file that you made with USBRip (more information can be found [here](https://github.com/snovvcrash/usbrip)). Also ensure you change `reciever@example.com` and `sender@example.com` in the scrip to the email adress for the updates to be sent to and the email adress sending the messages 

Additionally `sender@example.com` must be configured with your linux MTA. As of now, this script only supports `sendmail`, meaning that if you use a different MTA such as `PostFix` you must modify line 14 of the code to work with your MTA of choice. If you don't know what this means, you can easily configure your machine to work with this script by following [this guide](https://totallynoob.com/configure-ssmtp-on-linux-how-to-send-mail-from-linux-system-with-gmail-as-smarthost/)

