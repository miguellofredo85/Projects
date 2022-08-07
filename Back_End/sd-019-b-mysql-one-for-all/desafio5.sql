select cancoes.nome_cancao as cancao,
count(data_reproducoes.cancao_id) as reproducoes
from data_reproducoes as data_reproducoes
inner join cancoes as cancoes
on cancoes.cancao_id = data_reproducoes.cancao_id
group by nome_cancao 
order by reproducoes desc, cancao asc 
limit 2;