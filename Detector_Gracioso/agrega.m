
function IMAGEN = agrega( imagen, sticker, alfa, columna, linea, altura, largo )
     %agrega: Agrega una imagen pequeña a una IMAGEN más grande, formando una nueva IMAGEN. 
     % Se supone que funciona con imágenes PNG para que se vea bien en la
     % ausencia de fonfo
     
             % INPUT: 
             % imagen: IMAGEN
             % sticker: icono que se superpondrá a la imagen 
             % alpha: opacidad o transparencia de sticker
             % columna: columna N inicial para marcar la pegatina en la imagen;
             % (inicio de y) 

             % linea: línea M inicial para marcar el adhesivo en la imagen  
             %(inicio de x)

             % largo: No. columnas que ocupará la pegatina;
             %(final de x)

             % altura: nº de líneas que ocupará el adhesivo. 
             %(final de y)

     % SALIDA: 
     %IMAGEN: IMAGEN que es la combinación de imagenes
     %
    %   Rerferecnoas:
    %  https://www.mathworks.com/help/matlab/ref/repmat.html
    
    % se cambia el tamaño de IMAGEN con imresize, según la altura y el ancho de la parte del cuerpo detectada. Esto se hace
    % para que el icono siempre tenga dimensiones consistentes con la parte
    % detectada en 'detecta'
    
    sticker = imresize(sticker, [altura largo]);
    alfa = imresize(alfa, [altura largo]);
    
    % Alpha debe seguir la estructura MxNx3, para que% pueda combinarse con los canales RGB de las imágenes (3 dimensiones).
    %repmat repite los valores de un array, en este caso el 1,1 en el 3
    alfa = repmat(alfa, [1 1 3]);
    
   %se hacen dobles para permitir hacer operaciones
    imagen = im2double(imagen);
    sticker = im2double(sticker);
    alfa = im2double(alfa);
    
    % Cálculo para la combinación de imágenes
    %se recupera la imagen del argumento
    IMAGEN = imagen;
    IMAGEN(linea:(linea+size(sticker,1)-1), columna:(columna+size(sticker,2)-1), :) = sticker .* alfa + imagen(linea:(linea+size(sticker,1)-1), columna:(columna+size(sticker,2)-1), :) .* (1 - alfa);
    %del incio de la linea tanto en y como en x hasta su final dictado
     %por 'detecta' esos pixeles seran igual al sticker* la opacidad + lo
     %que resta de la imagen original
     
end