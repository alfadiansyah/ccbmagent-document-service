package com.bankmega.ccbmagent.document.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bankmega.ccbmagent.document.mappers.GetAssigntoAttachmentDivisionMapper;
import com.bankmega.ccbmagent.document.mappers.GetAssigntoAttachmentMapper;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentBankMegaRequest;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentDivision;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentSyariahBankMegaRequest;
import com.bankmega.ccbmagent.document.model.responses.GetAssigntoAttachmentResponse;
import java.util.stream.Collectors;

@Service
public class GetAssigntoAttachmentService {

    private final GetAssigntoAttachmentMapper getAssigntoAttachmentMapper;
    private final GetAssigntoAttachmentDivisionMapper getAssigntoAttachmentDivisionMapper;

    @Autowired
    public GetAssigntoAttachmentService(GetAssigntoAttachmentMapper getAssigntoAttachmentMapper, 
                                        GetAssigntoAttachmentDivisionMapper getAssigntoAttachmentDivisionMapper) {
        this.getAssigntoAttachmentMapper = getAssigntoAttachmentMapper;
        this.getAssigntoAttachmentDivisionMapper = getAssigntoAttachmentDivisionMapper;
    }

    public GetAssigntoAttachmentResponse getCombinedUserAndDivisionData(String channel) {
        List<GetAssigntoAttachmentBankMegaRequest> bankMegaUsers = new ArrayList<>();
        List<GetAssigntoAttachmentSyariahBankMegaRequest> syariahBankMegaUsers = new ArrayList<>();
        List<GetAssigntoAttachmentDivision> divisions = new ArrayList<>();
        switch (channel) {
            case "Bank Mega":
                bankMegaUsers = getAssigntoAttachmentMapper.getActiveUsersForBankMega()
                    .stream()
                    .filter(user -> user.getUserName() != null && !user.getUserName().isEmpty())
                    .collect(Collectors.toList());  // Filter users with null or empty userName
                break;
            case "Mega Syariah":
                syariahBankMegaUsers = getAssigntoAttachmentMapper.getActiveUsersForMegaSyariah()
                    .stream()
                    .filter(user -> user.getUserName() != null && !user.getUserName().isEmpty())
                    .collect(Collectors.toList());  // Filter users with null or empty userName
                break;
            default:
                throw new IllegalArgumentException("Invalid channel: " + channel);
        }
        divisions = getAssigntoAttachmentDivisionMapper.getActiveDivisions();

        return GetAssigntoAttachmentResponse.builder()
                .userData(channel.equals("Bank Mega") ? bankMegaUsers : syariahBankMegaUsers)
                .divisiData(divisions)
                .build();
    }
}
