@echo off
setlocal enabledelayedexpansion

:: Configuración
set "URL_BASE=http://localhost:8081/products"
set "CONTENT_TYPE=Content-Type: application/json"

echo Insertando productos de ejemplo sin caracteres especiales...

:: Arreglo de nombres de productos
set nombres[0]=Laptop
set nombres[1]=Mouse
set nombres[2]=Monitor
set nombres[3]=Teclado
set nombres[4]=Auriculares
set nombres[5]=Disco Duro
set nombres[6]=SSD
set nombres[7]=Webcam
set nombres[8]=Parlante
set nombres[9]=Tablet

:: Arreglo de descripciones
set descripciones[0]=Laptop potente para trabajo y juegos
set descripciones[1]=Mouse ergonomico e inalambrico
set descripciones[2]=Monitor de alta resolucion
set descripciones[3]=Teclado mecanico retroiluminado
set descripciones[4]=Auriculares con sonido envolvente
set descripciones[5]=Disco duro externo de gran capacidad
set descripciones[6]=Unidad de estado solido rapida
set descripciones[7]=Camara web para videollamadas
set descripciones[8]=Parlante inteligente con control por voz
set descripciones[9]=Tablet para entretenimiento y productividad

:: Arreglo de precios
set precios[0]=1200.00
set precios[1]=50.00
set precios[2]=300.00
set precios[3]=120.00
set precios[4]=100.00
set precios[5]=80.00
set precios[6]=70.00
set precios[7]=60.00
set precios[8]=90.00
set precios[9]=250.00

:: Bucle para insertar 10 productos
for /L %%i in (0,1,9) do (
    echo.
    echo Insertando producto %%i: !nombres[%%i]!
    
    :: Crear el cuerpo JSON usando variables
    set "JSON_DATA={\"name\": \"!nombres[%%i]!\", \"price\": !precios[%%i]!, \"description\": \"!descripciones[%%i]!\"}"
    
    :: Ejecutar curl
    curl -X POST "%URL_BASE%" ^
         -H "%CONTENT_TYPE%" ^
         -d "!JSON_DATA!"
    
    if !errorlevel! neq 0 (
        echo Error al insertar el producto %%i
    ) else (
        echo Producto %%i insertado correctamente.
    )
)

echo.
echo Proceso finalizado.
pause