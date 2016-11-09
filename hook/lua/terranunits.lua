do
    oldTPodTowerUnit = TPodTowerUnit
    TPodTowerUnit = Class(oldTPodTowerUnit) {
        CreatePod = function(self, podName) oldTPodTowerUnit.CreatePod(self, podName)
            if self.LevelProgress and self.LevelProgress > 1.01 then
                self.PodData[podName].PodHandle:AddLevels(self.LevelProgress - 1)
            end
        end,
    }
end
