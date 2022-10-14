import sys
import os

def main():
    name = sys.argv[sys.argv.index('-name') + 1]
    # b = sys.argv[sys.argv.index('-b') + 1]
    # bc = 'manifests/name'
    bc = sys.argv[sys.argv.index('-bc') + 1]
    runWithName(name,bc)

def runWithName(name,bc):
    b = str(os.path.dirname(os.path.abspath(__file__))) + f'/../manifests/{name}'
    os.makedirs(b)
    print("bc:",b)
    runTool(b,bc)

def runTool(b,bc):
    pn = "USAF_PackageName"
    ps = "USAF_PackageSupplier"
    pv="USAF_PackageVersion_0.0"
    nsb = "http://USAF_UNOFFICIAL.gov"
    {'b':"BuildDropPath",
    'bc':"BuildComponentPath",
    'pn':"PackageName",
    'pv':"PackageVersion",
    'ps':"PackageSupplier",
    'nsb':"NamespaceUriBase"}
    run_MSN_Tool(b,bc,ps,pv,pn,nsb)

def run_MSN_Tool(b,bc,ps,pv,pn,nsb):
    os.system(f"sbom-tool.exe generate -b {b} -bc {bc} -ps {ps} -pv {pv} -pn {pn} -nsb {nsb}")

if __name__ == "__main__":
    main()