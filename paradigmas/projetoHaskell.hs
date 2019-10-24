-- Guilherme Tetsuya Inuy 198439
-- Luana Barros 201705

import Data.List
import qualified Data.Map as Map  
import Data.Maybe as Maybe

main = do
    contents <- getContents
    let pontos_todos = takeWhile (/= []) (map words (lines contents))
        label = tail (dropWhile (/= []) (map words (lines contents)))
        -- "dicionário" com os pontos com label iniciais
        dicio_label = makeDicionario label

        -- list com todos os nomes dos pontos
        pontos_nomes = separarPts pontos_todos

        -- list com nomes dos pontos que tem label
        pontos_com_label = separarPts label

        -- list com as labels existentes
        label_lista = sort $ listarLabels dicio_label pontos_com_label

        -- list com nomes dos pontos sem label
        pontos_sem_label = pontos_nomes \\ pontos_com_label

        -- "dicionário" com o nome dos pontos e suas coordenadas
        pontos_coord = changeToFloat (map tail pontos_todos)
        lista_pontos = zip pontos_nomes pontos_coord

        -- "dicionário" final após propagar o label para todos os pontos
        dicio_final = propagarLabel pontos_com_label pontos_sem_label lista_pontos dicio_label

        resposta = tuplaFinal dicio_final label_lista

    printResposta resposta
    
separarPts :: [[a]] -> [a]
separarPts list = head (transpose list)

changeToFloat :: [[String]] -> [[Float]]
changeToFloat [] = []
changeToFloat (x:xs) = [(map read x :: [Float])] ++ changeToFloat xs

makeDicionario [] = []
makeDicionario (a:as) = (head a, head $ tail a) : makeDicionario as

listarLabels dicio_label pontos_com_label = listarLabels' dicio_label pontos_com_label []
        where
            listarLabels' _ [] acc = acc
            listarLabels' dicio (a:as) acc =
                let
                    nome = Maybe.fromJust(lookup a dicio)
                in
                    listarLabels' dicio as ([nome]++acc)

calculaDist [] _ _ = []
calculaDist (a:as) (b:bs) dicionario = (a, calculaDistUmPt a (b:bs) dicionario) : calculaDist as (b:bs) dicionario
    where
        calculaDistUmPt ponto listaPontos dicionario = gerarDistancias coordNoLabel coordLabel listaPontos
            where 
                coordNoLabel = Maybe.fromJust(lookup ponto dicionario)
                coordLabel = getCoordenadas listaPontos dicionario
                
                gerarDistancias _ [] _ = []
                gerarDistancias pt1 (a:as) (b:bs) = (b,calculaDist2Pts pt1 a) : gerarDistancias pt1 as bs
                
                getCoordenadas [] dicionario = []
                getCoordenadas (a:as) dicionario = Maybe.fromJust(lookup a dicionario) : getCoordenadas as dicionario
                
                calculaDist2Pts pt1 pt2 = sqrt $ sum $ map (^2) $ map sub $ transpose [pt1, pt2]
                    where 
                        sub [a] = a
                        sub (a:as) = a - sub as

selPonto l = getPtMin $ calcularMins l
    where
        calcularMins l = map calcularPtMin l
            
        calcularPtMin tupla = (fst tupla, getPtMin $ snd tupla)
        
        getPtMin [t] = t
        getPtMin (a:as) = if snd a < snd minimo
            then a
            else minimo
            where minimo = getPtMin as

propagarLabel _ [] _ dicio_label = dicio_label
propagarLabel lista_label lista_semLabel lista_pontos dicio_label = propagarLabel nova_lista_label nova_lista_semLabel lista_pontos novo_dicio
    where
        teste_selecionar = selPonto $ calculaDist lista_label lista_semLabel lista_pontos
        ponto_selecionado = fst $ snd teste_selecionar
        ponto_selecionado_pai = fst teste_selecionar
        nova_lista_label = colocarPontoEmLabel ponto_selecionado lista_label
        novo_dicio = colocarPontoEmDicionario ponto_selecionado ponto_selecionado_pai dicio_label
        nova_lista_semLabel = removePontoEmNoLabel ponto_selecionado lista_semLabel

        colocarPontoEmLabel ponto listaLabel = insert ponto listaLabel

        colocarPontoEmDicionario ponto pai dicio_label = 
            let label = Maybe.fromJust(lookup pai dicio_label)
            in
                insert (ponto, label) dicio_label

        removePontoEmNoLabel ponto listaNoLabel = delete ponto listaNoLabel
        

tuplaFinal dicio_label lista_labels = tuplaFinal' dicio_label lista_labels
    where
        tuplaFinal' _ [] = []
        tuplaFinal' dicio_label (a:as) = (listarPtsDeUmLabel dicio_label a):tuplaFinal' dicio_label as

        listarPtsDeUmLabel dicio_label label = listarPtsDeUmLabel' dicio_label label []
            where
                listarPtsDeUmLabel' [] label acc = (label, sort acc)
                listarPtsDeUmLabel' (a:as) label acc = if snd a == label
                    then listarPtsDeUmLabel' as label (fst a:acc)
                    else listarPtsDeUmLabel' as label acc

printResposta (a:[]) = print a
printResposta (a:as) = do
    print a
    printResposta as