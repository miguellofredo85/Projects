select nome_cancao as nome_musica,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(nome_cancao, 'Circus', 'Pull Request'), 
'Silly', 'Nice'), 
'Inner Fire', 'Project'), 
'Her Own', 'Trybe'), 
'Streets', 'Code Review')
as novo_nome
from cancoes
where nome_cancao 
like "%Streets" or nome_cancao like "%Circus" or nome_cancao like "%Her Own" or nome_cancao like "%inner fire" or nome_cancao like "%Silly" or nome_cancao
order by nome_cancao ;    