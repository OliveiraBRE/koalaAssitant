===ENGLISH=====================================================================================================
Project was created to being a tool in animation scripts development, however there is potenciallity to help another scripts when need interations between two or more peds

to create assistant
/koalita

to assistant execute actions
/lita [command_name]

in config.lua there is the assistant model that will be spawned
in animations.lua there is an animation list it'll be iterated
in config/config.lua , at line 70, there is the function bridge between cmd and assistant (it'll be removed to own file)

--> until now I've set an animation list (first 100 animations from https://alexguirre.github.io/animations-list/ and show up animation name on screen and cmd) and get into a car if the PlayerPed is inside one.


===PORTUGUÊS====================================================================================================
Projeto criado para ser uma ferramenta no desenvolvimento de scipts de animação, porém há uma potencialidade em auxiliar em outros scripts que precise de interação entre dois ou mais peds

para criar a assistente
/koalita 

para a assistente executar uma ação
/lita [nome_do_comando]

em config.lua está o modelo de assistente a ser spawnado
em animations.lua está a lista das animações que será iterada (pelo comando /lita animation)
em client/client.lua, na linha 70, está a função que faz a ponte entre o cmd e a assistente (em breve será removido para um arquivo próprio)

--> até agora consegui setar a lista de animação (as 100 primeiras do site https://alexguirre.github.io/animations-list/ que mostra o nome na tela e no cmd) e entrar dentro do carro se o PlayerPed estiver dentro de um.
