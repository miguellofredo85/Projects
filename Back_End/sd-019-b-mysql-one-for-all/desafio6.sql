select round(min(plano.valor), 2) as faturamento_minimo,
round(max(plano.valor), 2) as faturamento_maximo,
round(avg(plano.valor), 2) as faturamento_medio,
round(sum(plano.valor), 2) as faturamento_total
from plano as  plano
inner join usuario as usuario
on usuario.plano_id = plano.plano_id;