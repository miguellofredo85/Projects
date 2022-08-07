select count(distinct nome_cancao) as cancoes, 
count(distinct ar.nome_artista) as artistas,
count(distinct al.nome_album) as albuns
from SpotifyClone.cancoes as c
inner join SpotifyClone.album as al
on al.album_id = c.album_id
inner join SpotifyClone.artista as ar
on ar.artista_id = al.artista_id;