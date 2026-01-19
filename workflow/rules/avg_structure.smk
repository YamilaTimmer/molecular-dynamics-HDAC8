# Determine avg residue configuration over last 50 ns of trajectory
rule avg_structure: 
    input:
        xtc = f"{DATA_DIR}/{{variant}}/output/{{variant}}-last-50ns.xtc",
        tpr = f"{DATA_DIR}/{{variant}}/output/{{variant}}-ion.tpr",
    output:
        ox = f"{DATA_DIR}/{{variant}}/output/{{variant}}-last-50ns-avg.pdb",

    shell:
        """
        printf "0" | gmx rmsf \
            -f {input.xtc} \
            -s {input.tpr} \
            -ox {output.ox} \
            -b 200000 \
            -e 250000
        """