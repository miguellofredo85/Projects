select artista.nome_artista as artista,
album.nome_album as album,
count(seguindo.artista_id) as seguidores
from album as album
inner join artista as artista
on artista.artista_id = album.artista_id
inner join seguindo as seguindo
on seguindo.artista_id = artista.artista_id
group by artista.nome_artista, album.nome_album
order by seguidores desc, nome_artista, nome_album;