select usuario.nome_usuario as usuario,
if(max(year(data_reproducao))="2021", 'Usuário ativo', 'Usuário inativo') as condicao_usuario
from data_reproducoes as data_reproducoes
inner join usuario as usuario
on usuario.usuario_id = data_reproducoes.usuario_id
group by usuario
order by usuario;