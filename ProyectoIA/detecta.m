function DETECTA = detecta(imagen, eleccion)
     % Crea un objeto clasificador, según la entrada escogida. Luego clasifica las áreas del
     % imagen correspondiente a la solicitud, devolviendo su ubicación y
     % su extensión (estas áreas corresponden a rasgos humanos).
     
     % Entrada: imagen: imagen donde queremos clasificar;
     % elección: cadena con información sobre el tipo de estructura a
     % clasificar (cara, nariz, ...).
     
     % SALIDA: DETECTADA: matriz MxN de tipo, que indica la ubicación y el tamaño de las áreas M

    %
    %   Referencias:
  
    %   https://www.mathworks.com/help/vision/ref/vision.cascadeobjectdetector-system-object.html
    
    
    %Crear objeto clasificador. Si "elegir" no es una cadena o tiene
     % de información no compatible, la operación es imposible.
    detector = vision.CascadeObjectDetector('ClassificationModel',eleccion);
    
   % Aplica el detector a la imagen de entrada. La clasificación (buena o mala) es
     % muy dependiente de la imagen elegida, dado que la detección de
     % de parámetros físicos humanos genéricos carecen de clasificadores
     % excepcionalmente robusto
    DETECTA = step(detector, imagen);
    
end

