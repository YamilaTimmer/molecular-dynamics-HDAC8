# Adjust .tpr so it does not include solvent (same thing was done with .xtc and .pdb)
rule tpr_conv: 
    input:
        idx = f"{DATA_DIR}/{{variant}}/index.ndx",
        tpr = f"{DATA_DIR}/{{variant}}/{{variant}}-MD.tpr",

    output:
        tpr = f"{DATA_DIR}/{{variant}}/output/{{variant}}-ion.tpr",
    shell:
        """
        printf "0" | gmx convert-tpr \
            -s {input.tpr} \
            -n {input.idx} \
            -o {output.tpr}
        """