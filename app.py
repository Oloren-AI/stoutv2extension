import oloren as olo
import sys
import io

from STOUT import translate_forward, translate_reverse

@olo.register()
def hello():
    return "Hello World!"

@olo.register()
def translate_forward_smi2iupac(smiles = olo.String()):
    result = translate_forward(smiles)
    print(result)
    return result

@olo.register()
def translate_reverse_iupac2smi(iupac = olo.String()):
    result = translate_reverse(iupac)
    print(result)
    return result

if __name__ == "__main__":
    olo.run("stoutv2extension", port=80)