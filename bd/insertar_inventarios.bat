@echo off
setlocal enabledelayedexpansion

:: Configuración
set "URL_BASE=http://localhost:8082/inventory"
set "CONTENT_TYPE=Content-Type: application/json"

echo Insertando registros de inventario de ejemplo...

:: Arreglo de IDs de productos (asegúrate de que estos IDs existan en tu product-service)
set productos[0]=1
set productos[1]=2
set productos[2]=3
set productos[3]=4
set productos[4]=5

:: Arreglo de cantidades de inventario
set cantidades[0]=100
set cantidades[1]=250
set cantidades[2]=50
set cantidades[3]=120
set cantidades[4]=80

:: Bucle para insertar 5 registros de inventario
for /L %%i in (0,1,4) do (
    echo.
    echo Insertando inventario para producto ID: !productos[%%i]! con cantidad: !cantidades[%%i]!
    
    :: Crear el cuerpo JSON usando variables
    set "JSON_DATA={\"productId\": !productos[%%i]!, \"quantity\": !cantidades[%%i]!}"
    
    :: Ejecutar curl
    curl -X POST "%URL_BASE%" ^
         -H "%CONTENT_TYPE%" ^
         -d "!JSON_DATA!"
    
    if !errorlevel! neq 0 (
        echo Error al insertar el inventario para producto ID !productos[%%i]!
    ) else (
        echo Inventario para producto ID !productos[%%i]! insertado correctamente.
    )
)

echo.
echo Proceso de insercion de inventarios finalizado.
pause