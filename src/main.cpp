#include <iostream>
#include <SDL2/SDL.h>
#include <string>

std::string getTitle() {
    std::string title = "AxonEngine [";
    
    #ifdef AXON_DEBUG
    title.append("Debug, ");
    #else 
    title.append("Release, ");
    #endif

    #ifdef AXON_64
    title.append("64-Bit]");
    #else 
    title.append("32-Bit]");
    #endif

    return title;
}

int main(int argc, const char* argv[]) { 
     
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window* window;

    window = SDL_CreateWindow(
        getTitle().c_str(),
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        1280,
        720,
        SDL_WINDOW_SHOWN
    );

    if (window == nullptr) {
        std::cout << "Failure to create window: \n " << SDL_GetError() << std::endl;
        SDL_Quit();
        return -1; 
    }

    SDL_Delay(5000);

    SDL_DestroyWindow(window);

    SDL_Quit();

    return 0;
}
