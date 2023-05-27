source lib/app.sh

import.source [inquirer:list.app]

echo "pilih : "
food=("1. halo" "2. ha")
list.input ["'select menu'",food,ap]

echo $ap
