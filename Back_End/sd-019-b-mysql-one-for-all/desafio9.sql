select count(*) as quantidade_musicas_no_historico
from data_reproducoes as data_reproducoes
inner join usuario as usuario
on usuario.usuario_id = data_reproducoes.usuario_id 
and usuario.nome_usuario = "Bill"; 