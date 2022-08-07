select artista.nome_artista as artista,
album.nome_album as album
from album as album
inner join artista as artista
on artista.artista_id = album.artista_id 
AND artista.nome_artista = "Walter Phoenix";  