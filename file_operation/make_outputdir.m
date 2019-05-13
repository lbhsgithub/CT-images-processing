function [address_struct,outputdir] = make_outputdir(address_struct,variable_name)
    % outputdir for dir which needs to store images
    outputdir=[address_struct.processeddir,variable_name,'\'];
    if ~exist(outputdir,'dir')
        mkdir(outputdir);
    end
    % add dir in address, for possible call later (for example, binarized and allpore,majorpore)
    eval(['address_struct.',variable_name,' = outputdir']);
end
