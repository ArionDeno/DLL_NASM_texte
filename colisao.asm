;enum Lados{E,D,C,B};

;typedef struct {
;	int x, y;
;	unsigned int w, h;
;} SDL_Rect;

;Lados colisaoAABB(const SDL_Rect *a, const SDL_Rect *b)
;{
; // cima   
; if(a->y < b->y + b->h)
; {
 ;  return C;  
 ;}
 ;// baixo
 ;if(a->h + a->y > b->y)
 ;{
 ; return B;   
 ;}

 ;//esquerdo
 ;if(a->x < b->x + b->w)
 ;{
 ; return E;   
 ;}

 ;//direito
 ;if(a->x + a->w > b->x)
 ;{
  ; return D;
 ;}
 
;}



;colisaoAABB(SDL_Rect const*, SDL_Rect const*)

section .text

global colisaoAABB
global _colisaoAABB


colisaoAABB:
_colisaoAABB:

  push ebp
  mov ebp, esp
  mov eax, DWORD  [ebp+8]
  mov eax, DWORD  [eax+4]
  mov edx, eax
  mov eax, DWORD  [ebp+12]
  mov eax, DWORD  [eax+4]
  mov ecx, eax
  mov eax, DWORD  [ebp+12]
  mov eax, DWORD  [eax+12]
  add eax, ecx
  cmp edx, eax
  jnb .L2
  mov eax, 2
  jmp .L1
.L2:
  mov eax, DWORD  [ebp+8]
  mov edx, DWORD  [eax+12]
  mov eax, DWORD  [ebp+8]
  mov eax, DWORD  [eax+4]
  add edx, eax
  mov eax, DWORD  [ebp+12]
  mov eax, DWORD  [eax+4]
  cmp edx, eax
  jbe .L4
  mov eax, 3
  jmp .L1
.L4:
  mov eax, DWORD  [ebp+8]
  mov eax, DWORD  [eax]
  mov edx, eax
  mov eax, DWORD  [ebp+12]
  mov eax, DWORD  [eax]
  mov ecx, eax
  mov eax, DWORD  [ebp+12]
  mov eax, DWORD  [eax+8]
  add eax, ecx
  cmp edx, eax
  jnb .L5
  mov eax, 0
  jmp .L1
.L5:
  mov eax, DWORD  [ebp+8]
  mov eax, DWORD  [eax]
  mov edx, eax
  mov eax, DWORD  [ebp+8]
  mov eax, DWORD  [eax+8]
  add edx, eax
  mov eax, DWORD  [ebp+12]
  mov eax, DWORD  [eax]
  cmp edx, eax
  jbe .L6
  mov eax, 1
  jmp .L1
.L6:
.L1:
  pop ebp
  ret