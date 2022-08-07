select usuario.nome_usuario as usuario,
count(data_reproducoes.usuario_id) as qtde_musicas_ouvidas,
round((sum(cancoes.segundos)/60), 2) as total_minutos
from SpotifyClone.data_reproducoes as data_reproducoes
inner join usuario as usuario
on usuario.usuario_id = data_reproducoes.usuario_id
inner join cancoes as cancoes
on cancoes.cancao_id = data_reproducoes.cancao_id
group by usuario.nome_usuario
order by usuario.nome_usuario;