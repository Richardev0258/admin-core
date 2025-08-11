@echo off
setlocal enabledelayedexpansion

:: Configuración
set "URL_BASE=http://localhost:8081/products"
set "CONTENT_TYPE=Content-Type: application/json"

echo Insertando productos de ejemplo...

:: Arreglo de nombres de productos
set nombres[0]=Laptop Gaming
set nombres[1]=Mouse Inalámbrico
set nombres[2]=Monitor 4K 27"
set nombres[3]=Teclado Mecánico RGB
set nombres[4]=Auriculares Bluetooth
set nombres[5]=Disco Duro Externo 1TB
set nombres[6]=SSD 500GB
set nombres[7]=Cámara Web HD
set nombres[8]=Altavoz Inteligente
set nombres[9]=Tablet 10 pulgadas

:: Arreglo de descripciones
set descripciones[0]=Potente laptop para juegos y trabajo
set descripciones[1]=Mouse ergonómico con conexión inalámbrica
set descripciones[2]=Monitor de alta resolución y colores vibrantes
set descripciones[3]=Teclado con retroiluminación y switches mecánicos
set descripciones[4]=Sonido envolvente con cancelación de ruido
set descripciones[5]=Almacenamiento amplio y portátil
set descripciones[6]=Velocidad y rendimiento mejorados para tu PC
set descripciones[7]=Videollamadas nítidas para trabajo o estudio
set descripciones[8]=Control por voz y excelente calidad de sonido
set descripciones[9]=Ideal para entretenimiento y productividad

:: Arreglo de precios (deben coincidir con los índices de nombres)
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