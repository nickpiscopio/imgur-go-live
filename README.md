# Imgur Go Live
## By Nick Piscopio

This project utilizes a few different things:
- Clean Architecture with a splash of MVVM
- I tried to separate the concerns as much as possible to allow for scaling the application, but I found myself fixating on making it perfect, so i tried to scale it back a little.
- The UI is very simple to get the point across for moving from view to view as well as calling APIs
- The API calls utilize async awaits, but they would need to be fleshed out more if we were doing more than 1 request type. It most likely would only work for GET requests currently because the parameters are placed in the headers currently. This wouldn't be a difficult task to complete in the future. Again, I started to get fixated on making it perfect, but I understand it is just to show my skills.
- I utilized a library called WrappingHStack to allow for easier wrapping of HStack items. I could have probavbly made this functionality myself, but I didn't see the need to go that in depth with the code.