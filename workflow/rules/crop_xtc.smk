# Crop trajectory (.xtc) so it only contains the final 50ns of the simulation
rule crop_xtc: 
    input:
        xtc = f"{DATA_DIR}/{{variant}}/output/{{variant}}-ion.xtc"
    output:
        xtc = f"{DATA_DIR}/{{variant}}/output/{{variant}}-last-50ns.xtc",
    shell:
        """
        gmx trjconv \
            -f {input.xtc} \
            -o {output.xtc} \
            -b 200000 \
            -e 250000
        """
