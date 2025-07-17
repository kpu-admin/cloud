package cn.lmx.kpu.sop.admin.dto.torna;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;

/**
 * @author 六如
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DocIdsParam {

    @NotNull
    private Collection<Long> docIds;


}
