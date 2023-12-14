def handler(context, inputs):
    
    # prefixo
    prefixo = inputs["resourceNames"][0][:2] # obtem o nome atual que foi formado no blueprint (n + numero do datacenter)
    
    # finalidade
    if inputs["customProperties"]["finalidade"] == 'bd':
	    finalidade = '1'
    elif inputs["customProperties"]["finalidade"] == 'app':
        finalidade = '2'
    elif inputs["customProperties"]["finalidade"] == 'apre':
    	finalidade = '3'
    elif inputs["customProperties"]["finalidade"] == 'oper':
        finalidade = '4'
    
    # sistema operacional
    if inputs["customProperties"]["osType"] == 'WINDOWS':
    	so = '0'
    elif inputs["customProperties"]["osType"] == 'LINUX':
    	so = '1'
    	
    # ambiente
    if inputs["customProperties"]["ambiente"] == 'prod':
    	ambiente = 'p'
    elif inputs["customProperties"]["ambiente"] == 'homolog':
        ambiente = 'h'
    elif inputs["customProperties"]["ambiente"] == 'dev':
        ambiente = 'd'
    elif inputs["customProperties"]["ambiente"] == 'lab':
        ambiente = 'l'
    
    # contador
    contador = inputs["resourceNames"][0][2:] # obtem os digitos finais a partir do contador nativo do vRA (Infrastructure > Custom Names)
    
    hostname = prefixo + finalidade + so + ambiente + contador # hostname final
    
    outputs = {}
    outputs["resourceNames"] = inputs["resourceNames"]
    outputs["resourceNames"][0] = hostname
    
    # log
    print("- PREFIXO:", prefixo)
    print("- FINALIDADE:", finalidade)
    print("- AMBIENTE:", ambiente)
    print("- CONTADOR:", contador)
    print("- NOME FINAL:", hostname)
    
    return outputs
