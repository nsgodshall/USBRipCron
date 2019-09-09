today=$(date +'%Y-%m-%d')
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
$(which usbrip) events history  --manufact "ATMEL AVR" -d $today -e -ql > ${dir}/${today}.txt

if [ -s ${dir}/logs/${today}.txt ]
        then
                echo "To: reciever@example.com" >> ${dir}/email.txt
                echo "From: 'USBRip' <sender@gmail.com>" >> ${dir}/email.txt
                echo "Subject: Suspicous USB devices connected to $(hostname) on $today" >> ${dir}/email.txt
                echo "MIME-Version: 1.0" >> ${dir}/email.txt
                echo "Content-Type: text/plain" >> ${dir}/email.txt
                cat  ${dir}/${today}.txt >> ${dir}/email.txt
                cat ${dir}/email.txt | $(which sendmail) -i -t
                rm ${dir}/email.txt
        else
                rm -f ${dir}/${today}.txt
fi 
