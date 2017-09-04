#ifndef COLISAO_H
#define COLISAO_H


typedef enum {E,D,C,B}Lados;

 Lados colisaoAABB(const SDL_Rect *a, const SDL_Rect *b);

#endif 