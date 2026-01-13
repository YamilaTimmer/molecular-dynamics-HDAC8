# Configure trajectory, so that only main system remains (protein + Zn ion)
rule trajectory_conversion:
    input:
        tpr = f"{DATA_DIR}/{{variant}}/{{variant}}-MD.tpr",
        xtc = f"{DATA_DIR}/{{variant}}/{{variant}}-MD.xtc",
        idx = f"{DATA_DIR}/{{variant}}/index.ndx",

    output:
        xtc_out = f"{DATA_DIR}/{{variant}}/output/{{variant}}-ion.xtc"
    shell:
        """
        printf "0\n0\n" | gmx trjconv \
            -s {input.tpr} \
            -f {input.xtc} \
            -pbc mol \
            -o {output.xtc_out} \
            -n {input.idx} \
            -center
        """
