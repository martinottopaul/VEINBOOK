library(DiagrammeR)

p1 <- grViz("digraph boxes_and_circles {
            graph [overlap = false,
            fontsize = 10,
            rankdir = TB,
            fontname = Helvetica]


            node [shape = box,
            style = filled,
            fillcolor = pink,
            fixedsize = false,
            color = black,
            fontcolor = black,
            fontize = 12]

            Vehicles;
            Speed;
            EmissionFactors;
            EmissionsArray;
            GriddedEmissionsArray;



            node [shape = circle,
            style = filled,
            fillcolor = SpringGreen,
            fixedsize = false,
            color = black,
            fontcolor = black,
            fontize = 12]

            traffic;
            profile;
            local_ef;

            node [shape = box,
            style = filled,
            fixedsize = false,
            fillcolor = grey88,
            color = black,
            fontcolor = black,
            fontize = 12]

            age;
            speed_ef;
            scaled_ef;
            emis;
            emis_det;
            emis_post;
            speciate;
            make_grid;
            emis_grid;
            emis_merge;

            edge [color = black,
            arrowhead = vee,
            penwidth = 1.5]

            emis_det->{local_ef speed_ef}
            traffic->netspeed
            traffic->age
            age->Vehicles
            netspeed -> Speed
            {Vehicles Speed profile}->emis
            local_ef->{scaled_ef EmissionFactors}
            speed_ef-> {scaled_ef  EmissionFactors}
            scaled_ef -> EmissionFactors
            EmissionFactors -> emis
            emis -> EmissionsArray
            EmissionsArray -> emis_post
            emis_post->{speciate emis_merge emis_grid}
            speciate -> emis_merge
            {make_grid speciate emis_merge}->emis_grid
            emis_grid -> {EmissionsGrid GriddedEmissionsArray}
            }
            ")
png(file = "figuras/dia.png", width = 500, height = 800, units = "px")
p1
dev.off()

