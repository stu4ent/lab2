#!/bin/bash

# Масив з іменами майбутніх користувачів
usernames=("user1" "user2" "user3")

# Цикл для перебору імен користувачів
for username in "${usernames[@]}"; do
    # Перевірка наявності каталогу з ім'ям користувача в /home
    if [ -d "/home/$username" ]; then
        echo "Каталог з ім'ям $username вже існує"
        continue
    fi
    
    # Створення каталогу з ім'ям користувача
    mkdir "/home/$username"
    
    # Додавання нового користувача
    useradd -m "$username"
    
    # Генерація пароля та збереження його у файлі з ім’ям користувача
    password=$(date +%s | sha256sum | base64 | head -c 12 ; echo)
    echo "$password" > "/home/$username/$username.password"
    
    # Створення ключа для доступу в систему по протоколу SSH
    ssh-keygen -t rsa -b 4096 -N "" -f "/home/$username/.ssh/id_rsa"
done

