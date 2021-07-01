from plexapi.myplex import MyPlexAccount
account = MyPlexAccount('', '')
plex = account.resource('').connect()


movies = plex.library.section('Movies')
for video in movies.search(unwatched=True):
    print(video.title)
