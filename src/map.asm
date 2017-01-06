public GetMapDC, GetBlock, SetBlock
public PosUp, PosDown
public MapInit
include <stdafx.inc>
include <images.inc>


CACHE_INVALID equ 0FFFFFFFFH
.const
Floor0   dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H
         dd 0001H, 0005H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0002H, 0000H, 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0001H
         dd 0001H, 0001H, 0002H, 0001H, 0001H, 0000H, 0001H, 0001H, 0001H, 0002H, 0001H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0002H, 0000H, 0000H, 0000H, 0001H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0001H, 0001H, 0001H, 0001H, 0001H, 0000H, 0001H
         dd 0001H, 0001H, 0002H, 0001H, 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0001H, 0001H, 0002H, 0001H, 0001H, 0001H, 0002H, 0001H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H
Floor1   dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H
         dd 0001H, 0005H, 0000H, 0101H, 0102H, 0101H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0000H, 0001H
         dd 0001H, 0202H, 0000H, 0000H, 0002H, 0000H, 0001H, 0200H, 0007H, 0000H, 0001H, 0000H, 0001H
         dd 0001H, 0000H, 0105H, 0000H, 0001H, 0000H, 0001H, 0201H, 0202H, 0000H, 0001H, 0000H, 0001H
         dd 0001H, 0001H, 0002H, 0001H, 0001H, 0000H, 0001H, 0001H, 0001H, 0002H, 0001H, 0000H, 0001H
         dd 0001H, 0007H, 0000H, 0000H, 0001H, 0000H, 0002H, 0103H, 0104H, 0103H, 0001H, 0000H, 0001H
         dd 0001H, 0000H, 0106H, 0000H, 0001H, 0000H, 0001H, 0001H, 0001H, 0001H, 0001H, 0000H, 0001H
         dd 0001H, 0001H, 0002H, 0001H, 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0001H, 0001H, 0002H, 0001H, 0001H, 0001H, 0002H, 0001H, 0001H
         dd 0001H, 0202H, 0000H, 0007H, 0001H, 0007H, 0000H, 0000H, 0001H, 0000H, 0103H, 0000H, 0001H
         dd 0001H, 0202H, 0000H, 0007H, 0001H, 0000H, 0000H, 0000H, 0001H, 0101H, 0203H, 0101H, 0001H
         dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H
Floor2   dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H
         dd 0001H, 0006H, 0000H, 0003H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0001H, 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H, 0001H, 0001H
         dd 0001H, 0000H, 0001H, 0001H, 0001H, 0001H, 0001H, 0000H, 0001H, 0001H, 0001H, 0001H, 0001H
         dd 0001H, 0000H, 0001H, 0007H, 0007H, 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0001H, 0007H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0001H, 0001H, 0001H, 0001H, 0000H, 0000H, 0000H, 0001H, 0001H, 0001H, 0001H
         dd 0001H, 0000H, 0001H, 0000H, 0000H, 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0001H, 0001H, 0001H, 0001H, 0000H, 0000H, 0000H, 0001H, 0001H, 0001H, 0001H
         dd 0001H, 0000H, 0001H, 0000H, 0000H, 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0000H, 0001H
         dd 0001H, 0005H, 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H

Floor3   dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H
         dd 0001H, 0000H, 0000H, 0001H, 0007H, 0203H, 0007H, 0001H, 0000H, 0001H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0001H, 0203H, 0007H, 0203H, 0001H, 0000H, 0002H, 0000H, 0000H, 0001H
         dd 0001H, 0104H, 0000H, 0001H, 0007H, 0203H, 0007H, 0001H, 0000H, 0001H, 0001H, 0001H, 0001H
         dd 0001H, 0002H, 0001H, 0001H, 0001H, 0000H, 0001H, 0001H, 0000H, 0001H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0103H, 0000H, 0000H, 0000H, 0101H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0002H, 0001H, 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0001H, 0001H, 0001H, 0001H
         dd 0001H, 0105H, 0000H, 0001H, 0001H, 0000H, 0001H, 0001H, 0000H, 0001H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0002H, 0104H, 0007H, 0001H
         dd 0001H, 0000H, 0000H, 0001H, 0000H, 0000H, 0000H, 0001H, 0000H, 0001H, 0001H, 0001H, 0001H
         dd 0001H, 0001H, 0001H, 0001H, 0001H, 0000H, 0001H, 0001H, 0102H, 0001H, 0000H, 0000H, 0001H
         dd 0001H, 0006H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H, 0000H, 0002H, 0000H, 0005H, 0001H
         dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H

; template
FloorE   dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0001H
         dd 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H, 0001H

; PosDown[i] means the position you will be transported when you touch downstair in the i-th floor 
PosDown Position <>, <>, <2, 1, 1>, <1, 10, 2>, <>
PosUp   Position <2, 1, 1>, <1, 2, 2>, <2, 11, 3>, <2, 1, 1>

.data?
State dd FLOOR_CNT * 13 * 13 dup(?)

.data
hDCCached dd 0
CachedIndex dd CACHE_INVALID

.code
; public void Map::Init();
; Copy Map from the const
MapInit proc uses eax ecx esi edi
    PrintText 'Map Initialization'
    mov CachedIndex, CACHE_INVALID
    mov ecx, FLOOR_CNT * 13 * 13
    mov esi, offset Floor0
    mov edi, offset State
    .while ecx
        mov eax, [esi]
        mov [edi], eax
        add esi, 4
        add edi, 4
        dec ecx
    .endw
    ret
MapInit endp

MapToHDC proc lCode
    mov eax, lCode
    .if eax == MAP_TYPE_PATH
        mov eax, hDCFloor
    .elseif eax == MAP_TYPE_WALL
        mov eax, hDCWall
    .elseif eax == MAP_TYPE_DOOR_YELLOW
        mov eax, hDCYellowDoor
    .elseif eax == MAP_TYPE_DOOR_BLUE
        mov eax, hDCBlueDoor
    .elseif eax == MAP_TYPE_DOOR_RED
        mov eax, hDCRedDoor
    .elseif eax == MAP_TYPE_UPSTAIR
        mov eax, hDCUpstair
    .elseif eax == MAP_TYPE_DOWNSTAIR
        mov eax, hDCDownstair
    .elseif eax == MAP_TYPE_KEY_YELLOW
        mov eax, hDCKeyYellow
    .elseif eax == MAP_TYPE_KEY_BLUE
        mov eax, hDCKeyBlue
    .elseif eax == MAP_TYPE_KEY_RED
        mov eax, hDCKeyRed
    .elseif eax == MAP_TYPE_ITEM_BOTTLE_RED
        mov eax, hDCBottleRed
    .elseif eax == MAP_TYPE_ITEM_BOTTLE_BLUE
        mov eax, hDCBottleBlue
    .elseif eax == MAP_TYPE_ITEM_STONE_RED
        mov eax, hDCStoneRed
    .elseif eax == MAP_TYPE_ITEM_STONE_BLUE
        mov eax, hDCStoneBlue
    .elseif eax == MAP_TYPE_ENEMY_01
        mov eax, hDCEnemy01
    .elseif eax == MAP_TYPE_ENEMY_02
        mov eax, hDCEnemy02
    .elseif eax == MAP_TYPE_ENEMY_03
        mov eax, hDCEnemy03
    .elseif eax == MAP_TYPE_ENEMY_04
        mov eax, hDCEnemy04
    .elseif eax == MAP_TYPE_ENEMY_05
        mov eax, hDCEnemy05
    .elseif eax == MAP_TYPE_ENEMY_06
        mov eax, hDCEnemy06
    .elseif eax == MAP_TYPE_ENEMY_07
        mov eax, hDCEnemy07
    .elseif eax == MAP_TYPE_ENEMY_08
        mov eax, hDCEnemy08
    .endif
    ret
MapToHDC endp

GetOffsetByIndex proc uses ebx index
    mov ebx, 13 * 13 * 4
    mov eax, index
    mul ebx
    add eax, offset State
    ret
GetOffsetByIndex endp

GetMapDC proc hWnd, index
    local @hDC: HDC
    local @hDCRet: HDC
    mov eax, index
    .if eax == CachedIndex
        ; Cache Hit
        mov eax, hDCCached
        ret
    .endif
    ; Cache Miss
    invoke DeleteObject, hDCCached

    invoke GetDC, hWnd
    mov @hDC, eax

    invoke CreateCompatibleDC, @hDC
    mov @hDCRet, eax
    invoke CreateCompatibleBitmap, @hDC, 13 * BLOCK_SIZE, 13 * BLOCK_SIZE
    invoke SelectObject, @hDCRet, eax

    invoke GetOffsetByIndex, index
    mov esi, eax
    mov edx, 0
    mov ch, 13
    .while ch
        mov ebx, 0
        mov cl, 13
        .while cl
            invoke MapToHDC, [esi]
            push ebx
            push edx
            push ecx
            invoke BitBlt, @hDCRet, ebx, edx, BLOCK_SIZE, BLOCK_SIZE, eax, 0, 0, SRCCOPY
            pop ecx
            pop edx
            pop ebx
            add ebx, BLOCK_SIZE
            add esi, 4
            dec cl
        .endw
        add edx, BLOCK_SIZE
        dec ch
    .endw
    mLet CachedIndex, index
    mLet hDCCached, @hDCRet
    ret
GetMapDC endp    

GetBlock proc uses ebx esi index, x, y
    invoke GetOffsetByIndex, index
    mov esi, eax
    mov eax, y
    mov ebx, 13
    mul ebx
    add eax, x
    shl eax, 2
    add esi, eax
    mov eax, [esi]
    ret
GetBlock endp

; void SetBlock(uint x, uint y, uint z, uint val);
SetBlock proc uses eax ebx esi x, y, z, val
    mov CachedIndex, CACHE_INVALID
    invoke GetOffsetByIndex, z
    mov esi, eax
    mov eax, y
    mov ebx, 13
    mul ebx
    add eax, x
    shl eax, 2
    add esi, eax
    mov eax, val
    mov [esi], eax
    ret
SetBlock endp

end