from plexapi.myplex import MyPlexAccount
account = MyPlexAccount('githireh@gmail.com', 'sE8g6b.XY!iUmpJ')
plex = account.resource('githire-svr').connect()


movies = plex.library.section('Movies')
for video in movies.search(unwatched=True):
    print(video.title)
