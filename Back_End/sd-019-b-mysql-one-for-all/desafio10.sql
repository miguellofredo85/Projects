select cancoes.nome_cancao as nome,
count(data_reproducoes.cancao_id) as reproducoes
from cancoes as cancoes
inner join data_reproducoes as data_reproducoes
on cancoes.cancao_id = data_reproducoes.cancao_id
inner join usuario as usuario
on usuario.usuario_id = data_reproducoes.usuario_id
where usuario.plano_id in (1, 4)
group by nome
order by nome;