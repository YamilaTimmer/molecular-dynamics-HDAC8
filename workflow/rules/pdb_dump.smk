# Make PDB based on first frame of trajectory
rule pdb_dump:
    input:
        xtc = f"{DATA_DIR}/{{variant}}/output/{{variant}}-ion.xtc",
        tpr = f"{DATA_DIR}/{{variant}}/{{variant}}-MD.tpr",
        idx = f"{DATA_DIR}/{{variant}}/index.ndx"
    output:
        pdb = f"{DATA_DIR}/{{variant}}/output/{{variant}}-ion.pdb",
    shell:
        """
        printf "0\n0\n" |gmx trjconv \
            -s {input.tpr} \
            -f {input.xtc} \
            -pbc mol \
            -o {output.pdb} \
            -dump 0 \
            -n {input.idx} \
            -center
        """
