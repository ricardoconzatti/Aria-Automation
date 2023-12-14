# https://conzatech.com/customizando-nomes-no-vrealize-automation-8-x-utilizando-o-abx
function Handler($context, $inputs) {
    $inputsString = $inputs | ConvertTo-Json -Compress

    $letras = 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z' # 26
    $outputs = $inputs

    if ($inputs.customProperties.clusterNodes -eq $null) { # novo deployment
        write-host "### NEW DEPLOYMENT"
    	$vmsCluster = $inputs.resourceNames # recebe os nomes do deployment
    	$prefixo = $inputs.resourceNames[0] # define o nome da primeira VM do deployment como prefixo para as outras
    	$outputs.customProperties.clusterPrefix = $prefixo # adiciona o prefixo no campo PREFIXO no deployment
    	$outputs.customProperties.clusterNodes = $vmsCluster.count # altera a quantidade de nodes do cluster no campo CLUSTERNODES no deployment
    	for ($i = 0; $i -ne $vmsCluster.count; $i++) { 
    	    $nomeFinal = $prefixo + $letras[$i] # monta o nome final
            $outputs.resourceNames[$i] = $nomeFinal # altera o nome no depoyment
            write-host "- Novo membro do cluster $prefixo criado :" $outputs.resourceNames[$i]
        }
        write-host "- Total de membros do cluster $prefixo :" $outputs.customProperties.clusterNodes
    }
    else { # atualiza o deployment
        write-host "### UPDATE DEPLOYMENT"
        $vmsCluster = $inputs.resourceNames # recebe o nome do deployment
        $clusterPrefix = $inputs.customProperties.clusterPrefix # recebe o prefixo do deployment
        $clusterNodes = $inputs.customProperties.clusterNodes # recebe a quantidade existente de nodes do deployment
        $clusterNewNodes = $inputs.customProperties.count # recebe a quantidade de nodes do deployment (nova solicitacao)
        $ii = [int]$clusterNodes # index para as letras
        for ($i = 0; $i -ne $vmsCluster.count; $i++) { # looping para as VMs
            $nomeFinal = $clusterPrefix + $letras[$ii] # monta o nome final
            $outputs.resourceNames[$i] = $nomeFinal # altera o nome no depoyment
            $outputs.customProperties.clusterNodes = $clusterNewNodes  # altera a quantidade de nodes do cluster no campo CLUSTERNODES no deployment
            write-host "- Novo membro do cluster $clusterPrefix criado :" $outputs.resourceNames[$i]
            $ii++
        }
        write-host "- Novos membros adicionados ao cluster $clusterPrefix :" $vmsCluster.count
        write-host "- Total de membros do cluster $clusterPrefix :" $outputs.customProperties.clusterNodes
    }
    return $outputs
}
