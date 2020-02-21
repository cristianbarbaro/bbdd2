module PlotProblemsHelper
    def problems_for_select
        Problem.all.collect { |t| [t.name, t.id] }
    end  
end
